import React from 'react'

export default class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = { weather: null }
    }

    fetchWeather(location) {
        return $.ajax({
            url: "api.openweathermap.org/data/2.5/weather?"
        })
    }

    render() {
        
    }
}