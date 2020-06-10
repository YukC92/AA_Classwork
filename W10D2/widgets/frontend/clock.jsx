import React from 'react';


export default class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { time: new Date() };
        this.handle = 0;
    }

    tick() {
        this.setState({ time: new Date() })
    }

    componentDidMount() {
        this.handle = setInterval(this.tick.bind(this), 1000);
    }

    componentWillUnmount() {
        clearInterval(this.handle)
    }

    render() {
        return (
        <h3 className="time">{this.state.time.toUTCString()}</h3>
        )
    }
}

