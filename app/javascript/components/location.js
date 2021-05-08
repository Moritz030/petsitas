const getLocation = () => {
  const locationElement = document.querySelector("#location-id");
  locationElement.addEventListener('click', () => {
    navigator.geolocation.getCurrentPosition(function(position) {
      fetch(`https://nominatim.openstreetmap.org/reverse?lat=${position.coords.latitude}&lon=${position.coords.longitude}`)
        .then((response) => {
                // Antwort kommt als Text-String       
                return response.text();
            })
        .then ((data) => {
              const xmlDoc = (new DOMParser())
                .parseFromString(data, "application/xml");
              // console.log(data);
              locationElement.value=xmlDoc.querySelectorAll('postcode')[0].innerHTML;
            });
        //   console.log(data)
        // console.log("Hello")


        // do_something(position.coords.latitude, position.coords.longitude);
      });
  });
}


export { getLocation };