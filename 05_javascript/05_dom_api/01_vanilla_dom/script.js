document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const listForm = document.querySelector('.list-container form');
  listForm.addEventListener('submit', e => {
    e.preventDefault();

    const formInput = document.querySelector('.favorite-input');
    const sfPlaces = document.querySelector('#sf-places');
    let formValue = formInput.value;
    let newPlace = document.createElement('li');

    newPlace.innerHTML = formValue;
    sfPlaces.appendChild(newPlace);
    formInput.value = '';
  });



  // adding new photos

  // --- your code here!
  const photoFormContainer = document.querySelector('.photo-form-container');
  const photoShowButton = document.querySelector('.photo-show-button');

  photoShowButton.addEventListener('click', e => {
    // console.log('clicked on toggle!');
    photoFormContainer.classList.toggle('hidden');
  });

  const photoForm = document.querySelector('.photo-form-container form');

  photoForm.addEventListener('submit', e => {
    e.preventDefault();

    let photoUrlInput = document.querySelector('.photo-url-input');
    let newPhotoItem = document.createElement('li');
    let newPhoto = document.createElement('img');
    let newPhotoUrl = photoUrlInput.value;

    newPhoto.setAttribute('src', newPhotoUrl);
    newPhotoItem.appendChild(newPhoto);

    let photoGallery = document.querySelector('.dog-photos');
    photoGallery.appendChild(newPhotoItem);
    
    photoUrlInput.value = '';
    
  });





});
