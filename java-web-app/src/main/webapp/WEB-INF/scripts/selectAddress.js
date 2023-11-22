document.addEventListener('DOMContentLoaded', function () {
  // Initial setup
  updateFormContent();

  // Add event listener for pickupType and returnType change
  var pickupTypeSelect = document.getElementById('pickupType');
  pickupTypeSelect.addEventListener('change', updateFormContent);

  var returnTypeSelect = document.getElementById('returnType');
  returnTypeSelect.addEventListener('change', updateFormContent);

  // Populate hours for pickup and return
  populateHours('pickupTime');
  populateHours('returnTime');
});

function updateFormContent() {


  var pickupType = document.getElementById('pickupType').value;
  var returnType = document.getElementById('returnType').value;

  // Hide all form-content divs
  document.querySelectorAll('.form-content').forEach(function (div) {
    console.log('Hiding:', div.id);
    div.style.display = 'none';
  });

  // Show the selected form-content
  document.getElementById(pickupType + 'Content').style.display = 'block';
  document.getElementById(returnType + 'Content').style.display = 'block';

  // Show/hide additional fields based on pickup type
  var pickupAgencyNameField = document.getElementById('pickupAgencyNameField');
  var pickupDeliveryAddressFields = document.getElementById('pickupDeliveryAddressFields');
  var returnAgencyNameField = document.getElementById('returnAgencyNameField');
  var returnDeliveryAddressFields = document.getElementById('returnDeliveryAddressFields');

  if (pickupType === 'agency') {
    pickupAgencyNameField.style.display = 'block';
    pickupDeliveryAddressFields.style.display = 'none';
  } else {
    pickupAgencyNameField.style.display = 'none';
    pickupDeliveryAddressFields.style.display = 'block';
  }

  if (returnType === 'agency') {
    returnAgencyNameField.style.display = 'block';
    returnDeliveryAddressFields.style.display = 'none';
  } else {
    returnAgencyNameField.style.display = 'none';
    returnDeliveryAddressFields.style.display = 'block';
  }
}

function populateHours(selectId) {
  var select = document.getElementById(selectId);

  for (var hour = 9; hour <= 19; hour++) {
    for (var minute of ['00', '30']) {
      var option = document.createElement('option');
      option.text = `${hour}:${minute}`;
      option.value = `${hour}:${minute}`;
      select.add(option);
    }
  }
}
