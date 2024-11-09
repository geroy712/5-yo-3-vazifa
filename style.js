for (let i = 1; i <= 50; i++) {
    console.log(i);
}

let sum = 0;
for (let i = 1; i <= 50; i++) {
    sum += i;
}
console.log("Yigindi:", sum);

let product = 1;
for (let i = 1; i <= 50; i++) {
    product *= i;
}
console.log("Kopaytma:", product);

let names = ["guli", "doston", "mubi", "Zaynab", "madi"];
for (let name of names) {
    console.log(`Salom, ${name}!`);
}

let shortNames = names.filter(name => name.length <= 5);
console.log("Yangi royxat:", shortNames);