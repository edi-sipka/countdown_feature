import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["countdown"]
  connect() {
 
    this.secondsUntilEnd =    
    this.countdownTarget.dataset.secondsUntilEndValue;

    const time = new Date().getTime();
    this.endTime = new Date(time + this.secondsUntilEnd * 1000);

    this.countdown = setInterval(this.countdown.bind(this),250);
  }

  countdown(){
    const time = new Date();
    const secondsRemaining = (this.endTime - time) / 1000;

    if (secondsRemaining <= 0) {
      clearInterval(this.countdown);
      this.countdownTarget.innerHTML = "It is over";
      return;
    }
    const secondsPerDay = 86400;
    const secondsPerHour = 3600;
    const secondsPerMinute = 60;

    const days = Math.floor(secondsRemaining/secondsPerDay);
    const hours = Math.floor((secondsRemaining % secondsPerDay) / secondsPerHour);
    const minutes = Math.floor(
      (secondsRemaining % secondsPerHour) / secondsPerMinute
    );
    const seconds = Math.floor(secondsRemaining % secondsPerMinute) 

    this.countdownTarget.innerHTML = `${days} days, ${hours} hours, ${minutes} minutes, ${seconds} seconds `
  }
}
