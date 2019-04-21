// $(document).ready(() => {
//   console.log('DOM is ready!');
// });

// $(() => {
//   console.log('DOM is ready 2!');
// });


$(() => {
  let listItems = $("#first_list li");

  // console.log(listItems.text());

  console.log(listItems.eq(0).html());

  let list = $('ul#first_list');

  let newListItem = $('<li></li>');
  let newItemLink = $('<a>', {
    href: 'https://www.google.com',
    html: 'Click me!',
    rel: 'no-follow'
  });

  newListItem.append(newItemLink);

  list.append(newListItem);

  listItems = $('#first_list li');

  console.log(listItems.eq(0).is('.special'));
  console.log(listItems.eq(1).is('.special'));
  
  listItems.html((i, old) => {
    return old + '!!!';
  });

  listItems.each((i, el) => {
    $(el).prepend('<b>' + i + '</b>: ');
  });

  console.log(listItems.filter('.special').html());
  console.log(listItems.not('.special').text());

  $('ul').append($('<p>Appended p</p>'))

  console.log(listItems);
  listItems.eq(1).removeClass('special');
  listItems.eq(0).addClass('addedClass');
  console.log(listItems);  

  listItems.eq(4).css({
    'backgroundColor': 'pink',
    'display': 'inline-block'
  });
  

  let form = $('#form_input');
  let formOutput = $('#form_output');


  form.on('input', (event) => {
    formOutput.text(form.val());
  });

  let link = listItems.eq(4);
  console.log(link.css('background-color'));

  let linkClone = link.clone();

  $('ul').append(linkClone);

  $('li').eq(5).remove();



  // Difference between remove() & detach()
  listItems.on('click.first, mouseenter', function(event) {
    console.log('First click or mouseenter listener activated!');
    console.log(event.pageY);
  });

  listItems.on('click.second', function () {
    console.log('Second click listener activated!');
  });

  let removedListItem = listItems.first().detach();

  $('ul').append(removedListItem);

  // listItems.eq(0).trigger('click');
  // listItems.eq(0).trigger('click');
  // listItems.eq(0).trigger('click');
  // listItems.eq(0).trigger('click');
  // listItems.eq(0).trigger('click');
  // listItems.trigger('click');
  // listItems.click();

  listItems.off('click.first');

  listItems.trigger('click.second');

  let links = $('a');

  links.on('click', function(e) {
    e.preventDefault();
    console.log($(this).attr('href'));
  });
  

  // Event delegation
  let lastList = $('#my_unordered_list');

  lastList.on('click', 'li', function(event) {
    event.preventDefault();
    console.log(this);
  });

  lastList.append($('<li>Appended li</li>'));
  
});

