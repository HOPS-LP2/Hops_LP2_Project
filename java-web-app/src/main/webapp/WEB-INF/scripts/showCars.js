document.addEventListener('DOMContentLoaded', () => {
  const rentBtns = document.querySelectorAll(".rent-button-js");

  rentBtns.forEach((rentBtn) => {
    rentBtn.addEventListener('click', () => {
      const carId = rentBtn.getAttribute('data-car-id');
      selectCar(carId);
    })
  })
})

function selectCar(carId) {
  if (carId) {
    fetch(`/hops-1.0/showCars?action=selectedCar&carId=${carId}`, {
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