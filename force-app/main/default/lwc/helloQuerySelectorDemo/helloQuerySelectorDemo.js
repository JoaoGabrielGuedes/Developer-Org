import { LightningElement } from 'lwc';

export default class HelloQuerySelectorDemo extends LightningElement {
  userNames = ["John", "Jane", "Jack"];

  fetchDetailHandler() {
    const elem = this.template.querySelector('h1');
    elem.style.border="1px solid blue";
    console.log(elem.innerText);

    const userElem = this.template.querySelectorAll('.name');    
    Array.from(userElem).forEach((user) => {
      console.log(user.innerText);
      item.setAttribute("title", item.innerText);
    });

    //lwc:manual demo
    const childElem = this.template.querySelector('.child');
    childElem.innerHTML = '<p>Hey I am child element</p>';
  }  
}  