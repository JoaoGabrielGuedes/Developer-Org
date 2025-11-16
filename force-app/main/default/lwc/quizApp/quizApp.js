import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

  selected = {}; //store answers
  correctAnswers = 0; //show the number of corrected answers
  isSubmitted = false; //used to show the result
  myQuestions = [
    {
      id: "Question 1",
      question: "What is the capital of France?",
      answers: {
        a: "Paris",
        b: "London",
        c: "Berlin"
      },
      correctAnswer: "a"
    },
    {
      id: "Question 2",
      question: "What is the largest planet in our solar system?",
      answers: {
        a: "Mars",
        b: "Jupiter",
        c: "Saturn"
      },
      correctAnswer: "b"
    },
    {
      id: "Question 3",
      question: "What is the chemical symbol for gold?",
      answers: {
        a: "Au",
        b: "Ag",
        c: "Cu"
      },
      correctAnswer: "a"
    }
  ];

  get allNotSelected() {
    return !(Object.keys(this.selected).length === this.myQuestions.length);
  }

  get isScoredFull() {
    return `slds-text-heading_large ${this.correctAnswers === this.myQuestions.length ?
    'slds-text-color_sucess' : 'slds-text-color_error'}`;
  }

  changeHandler(event) {
    console.log("name:" +event.target.name);
    console.log("value: " +event.target.value);    
    const { name, value } = event.target; 
    // short form of:
    // const name = event.target.name;
    // const value = event.target.value;
    this.selected = { ...this.selected, [name]: value };
    //this.selected={"Question 1":"a "}
  }

  submitHandler(event){
    event.preventDefault();
    //this.selected = {"Question 1":"a","Question 2":"b","Question 3":"a"}
    let correct = this.myQuestions.filter(item => this.selected[item.id] === item.correctAnswer);
    this.correctAnswers = correct.length;
    this.isSubmitted = true;
    console.log("this.correctAnswers: " + this.correctAnswers);
  }


  resetHandler(){
    this.selected = {};
    this.correctAnswers = 0;
    this.isSubmitted = false;
  }
}