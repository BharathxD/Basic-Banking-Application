(() => {
  "use strict";

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll(".needs-validation");

  // Loop over them and prevent submission
  Array.from(forms).forEach((form) => {
    form.addEventListener(
      "submit",
      (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add("was-validated");
      },
      false
    );
  });
})();

function getLog() {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      try {
        var data = JSON.parse(xhr.responseText);
      } catch (err) {
        console.log(err.message + " in " + xhr.responseText);
        return;
      }
      console.log(data);
      data.forEach((Element) => {
        console.log(Element);
        var tag = document.createElement("p");
        var text = document.createTextNode(
          `${Element["sender_name"]} (Account Number ${Element["sender_id"]}) sent ${Element["transaction_amount"]} Rupees to ${Element["reciever_name"]} (Account Number ${Element["reciever_id"]}) on ${Element["transaction_date"]}`
        );
        tag.appendChild(text);
        var element = document.getElementById("log-context-container");
        element.appendChild(tag);
      });
    }
  };
  var url = "http://localhost:3000/logs";
  xhr.open("GET", url, true);
  // Sending our request
  xhr.send();
}



const exampleModal = document.getElementById("transaction");
var counter = 0;
exampleModal.addEventListener("show.bs.modal", (event) => {
  // Button that triggered the modal
  const button = event.relatedTarget;
  // Extract info from data-bs-* attributes
  const recipient = button.getAttribute("data-bs-whatever");
  //! Sending an AJAX Request
  if (counter < 1) {
    getLog()
  }
  counter++;
});