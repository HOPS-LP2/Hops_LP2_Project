let selectedAgencyId;

document.addEventListener('DOMContentLoaded', function () {
    const locationInput = document.getElementById('location');
    const agenciesList = document.getElementById('agenciesList');

    function renderAgencies(agencies) {
        agenciesList.innerHTML = "";

        agencies.forEach((agency) => {
            const card = document.createElement('div');
            card.classList.add('card', 'mb-3');

            const cardBody = document.createElement('div');
            cardBody.classList.add('card-body');

            const title = document.createElement('h5');
            title.classList.add('card-title');
            title.textContent = agency.name;

            const address = document.createElement('p');
            address.classList.add('card-text');
            address.textContent = `${agency.address}`;

            const openCloseTimes = document.createElement('p');
            openCloseTimes.classList.add('card-text');
            openCloseTimes.textContent = `Horário de Funcionamento: 08:00h - 20:00h`;

            const distance = document.createElement('p');
            distance.classList.add('card-text');
            distance.textContent = `${agency.distance.toFixed(1)}km`;

            cardBody.appendChild(title);
            cardBody.appendChild(address);
            cardBody.appendChild(openCloseTimes);
            cardBody.appendChild(distance);

            card.appendChild(cardBody);

            agenciesList.appendChild(card);

            cardBody.setAttribute('data-agency-id', agency.agency_id);
            cardBody.setAttribute('data-agency-name', agency.name);

            cardBody.addEventListener('click', function (event) {
                locationInput.value = cardBody.getAttribute('data-agency-name');

                selectedAgencyId = cardBody.getAttribute('data-agency-id');
                console.log(selectedAgencyId);

                agenciesList.style.display = 'none';
            });
        });

        agenciesList.style.display = 'block';
    }

    function showCars() {
        if (selectedAgencyId) {
            fetch(`/hops-1.0/showCars?action=showCars&agencyId=${selectedAgencyId}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    if (response.redirected) {
                        window.location.href = response.url;
                    }
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
        }
    }

    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault();

        showCars();
    });

    locationInput.addEventListener('input', function () {
        const userInputLocation = locationInput.value;
        const submitButton = document.querySelector('.btn-search')

        submitButton.disabled = !selectedAgencyId && userInputLocation.length < 2;

        if (userInputLocation.length < 2) {
            agenciesList.innerHTML = "";
            return;
        }

        getNearestAgencies(userInputLocation);
    });

    document.addEventListener('click', function (event) {
        const isClickInside = locationInput.contains(event.target) || agenciesList.contains(event.target);

        if (!isClickInside) {
            agenciesList.style.display = 'none';
        }
    });

    function getNearestAgencies(userInputLocation) {
        console.log(userInputLocation);
        fetch(`/hops-1.0/getAgencies?action=getByLocation&inputLocation=${encodeURIComponent(userInputLocation)}`)
            .then(response => {
                if (!response.ok) {
                    console.log(response.status)
                    throw new Error(response.statusText);
                }
                return response.json();
            })
            .then(data => {
                renderAgencies(data);
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }
});