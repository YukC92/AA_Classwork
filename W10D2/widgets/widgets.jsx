import React from 'react';
import ReactDOM from 'react-dom'

import Clock from './frontend/clock'
import Tabs from './frontend/tabs'
import Weather from './frontend/weather'

function Root() {

    const tabs = [
        { title: "one", content: "i am first" }, 
        { title: "two", content: "i am second" }, 
        { title: "three", content: "i am third" }]

    return (
        <div>
            <Clock />
            <Weather /> 
            <div className="interactive">
                <Tabs tabs={tabs}/>

            </div>
        </div>
    )
}

document.addEventListener('DOMContentLoaded', () => {
    
    ReactDOM.render(< Root />, document.getElementById('main'))
})
