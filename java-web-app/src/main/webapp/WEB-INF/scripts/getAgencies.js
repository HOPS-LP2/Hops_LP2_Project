const locationInput = document.getElementById('location');
const resultsContainer = document.getElementById('resultsContainer');

locationInput.addEventListener('input', function () {
  const userInputLocation = locationInput.value;

  if (userInputLocation.length < 2) {
    return;
  }

  // Make a request to the servlet when the user types
  fetch(`/hops-1.0/getAgencies?action=getByLocation&inputLocation=${encodeURIComponent(userInputLocation)}`)
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      // Handle the data and update the results container
      console.log(data)
    })
    .catch(error => {
      console.error('There was a problem with the fetch operation:', error);
    });
});

function updateResults(data) {
  // Clear previous results
  resultsContainer.innerHTML = '';

  // Process the data and update the results container
  // You can customize this part based on your data structure
  data.forEach(agency => {
    const agencyElement = document.createElement('div');
    agencyElement.textContent = `ID: ${agency.agency_id}, Name: ${agency.name}, City: ${agency.city}, State: ${agency.state}, CEP: ${agency.cep}, Address: ${agency.address}, Location: ${agency.location}, Distance: ${agency.distance}`;
    resultsContainer.appendChild(agencyElement);
  });
}