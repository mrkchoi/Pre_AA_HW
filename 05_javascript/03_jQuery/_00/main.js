// $(document).ready(() => {
//   console.log('DOM is ready!');
// });

// $(() => {
//   console.log('DOM is ready 2!');
// });


$(() => {
  let listItems = $("li");

  // console.log(listItems.text());

  console.log(listItems.eq(0).html());

  let list = $('ul');

  let newListItem = $('<li></li>');
  let newItemLink = $('<a>', {
    href: 'https://www.google.com',
    html: 'Click me!',
    rel: 'no-follow'
  });

  newListItem.append(newItemLink);

  list.append(newListItem);

  listItems = $('li');

  console.log(listItems.eq(0).is('.special'));
  console.log(listItems.eq(1).is('.special'));
  
  listItems.html((i, old) => {
    return old + '!!!';
  });

  listItems.each((i, el) => {
    $(el).prepend('<b>' + i + '</b>: ');
  });
  
});