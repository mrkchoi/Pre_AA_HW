const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function teaAndBiscuits() {
  let first, second;

  reader.question('Would you like some tea?\n', (res1) => {    
    console.log(`You replied: ${res1}\n\n`);
    reader.question('Would you like some biscuits?\n', (res2) => {
      console.log(`You replied: ${res2}\n\n`);
      first = res1;
      second = res2;
      
      const firstRes = (first === 'yes') ? 'do' : 'do not';
      const secondRes = (second === 'yes') ? 'do' : 'do not';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want coffee.`);

      reader.close();
    });
  });
}

teaAndBiscuits();
