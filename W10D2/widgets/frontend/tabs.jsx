import React from 'react';

export default class Tabs extends React.Component { //job index
    constructor(props) { // title and content
        super(props);
        this.state = {
            idx: 0
        }
       
    }

    selectedTab(idx) {
        return () => {
            this.setState({idx: idx}, () => {
                console.log(this.state)
            })
        }
    }

    render() {
        return (
            <div className="all-tabs">
                {this.props.tabs.map((tab, idx) => {
                    return (
                        <ul className="tab" key={idx}>
                            <h1 onClick={this.selectedTab(idx)}> {tab.title}</h1>
                            <article>
                                {tab.content}
                            </article>
                        </ul>

                    ) 
                })}
            </div>
        )
    }
}

// const Header = ({title, content}) =>  { //job index item
//     return (

//     )
// }