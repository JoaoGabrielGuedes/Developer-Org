import { LightningElement } from 'lwc';

export default class Looping extends LightningElement {
  carList = ["Ford", "Audi", "BMW", "Fiat", "Toyota", "Honda", "Mercedes"];

  ceoList = [
    {
      id: 1,
      name: "Elon Musk",
      company: "Tesla",
      age: 49
    },
    {
      id: 2,
      name: "Jeff Bezos",
      company: "Amazon",
      age: 57
    },  
    {
      id: 3,
      name: "Bill Gates",
      company: "Microsoft",
      age: 66
    },
    {
      id: 4,
      name: "Mark Zuckerberg",
      company: "Facebook",
      age: 39
    },
    {
      id: 5,
      name: "Larry Page",
      company: "Google",
      age: 48
    }
  ]
}