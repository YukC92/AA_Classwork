
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs) {
  const dogLinks = []
  let dogNames = Object.keys(dogs) // return array of keys(dogname)['Corgi', 'Australian Shepherd']
  
  dogNames.forEach((dogName) => {
    let doglink = document.createElement('a'); //<a></a>
    doglink.innerHTML = dogName;  //<a>Corgi</a>
    doglink.href = dogs[dogName]; //<a href="https://www.akc.org/dog-breeds/cardigan-welsh-corgi/">Corgi</a>
    
    let doglist = document.createElement('li'); //<li></li>
    doglist.className = "dog-link"; //<li><a href></li>
    doglist.classList.add("hidden")
    
    doglist.appendChild(doglink); //appendChild for DOM syntax

    dogLinks.push(doglist) //<li><a href></li>
  })

  return dogLinks;
}

function attachDogLinks() {
  let dogUl = document.querySelector(".drop-down-dog-list")
  let dogLinks = dogLinkCreator(dogs)
  dogLinks.forEach(li => dogUl.appendChild(li))
}

attachDogLinks();


function handleEnter() {
  let doglists = document.querySelectorAll(".dog-link")
  doglists.forEach((doglist) => doglist.classList.remove('hidden')) //display : hidden
}

function handleLeave() {
  let doglists = document.querySelectorAll(".dog-link")
  doglists.forEach((doglist) => doglist.classList.add('hidden')) //display : hidden

}

let nav = document.querySelector(".drop-down-dog-nav")
nav.addEventListener("mouseenter", handleEnter)
nav.addEventListener("mouseleave", handleLeave)