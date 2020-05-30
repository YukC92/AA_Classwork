class Clock {
    constructor() {
      // 1. Create a Date object.
        const timeNow = new Date();
      // 2. Store the hours, minutes, and seconds.
        this.hours = timeNow.getHours();
        this.minutes = timeNow.getMinutes();
        this.seconds = timeNow.getSeconds();
      // 3. Call printTime.
        this.printTime();
      // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000); 
        // debugger //setInterval(callback, delay[, ...args])
    }

    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
    //   if (this.seconds < 10) {
    //       this.seconds =  '0' + this.seconds
    //   } else {
    //       return this.seconds
    //   }
    
      const timeStirng = `${this.hours}:${this.minutes}:${this.seconds}`;
      console.log(timeStirng);
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this._incrementSecond();
      this.printTime();
    }

    _incrementSecond(){
      this.seconds += 1;
      if (this.seconds === 60){
        this.seconds = 0;
        this._incrementMinute();
      }
    };

    _incrementMinute(){
      this.minutes += 1;
      if (this.minutes === 60){
        this.minutes = 0;
        this._incrementHour();
      }
    };

    _incrementHour(){
      this.hours = (this.hours + 1) % 24;
    };
    debugger
}

  
  const clock = new Clock();

