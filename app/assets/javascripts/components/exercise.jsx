'use strict';

const e = React.createElement;

class Exercise extends React.Component {

    constructor(props) {
        super(props);
            console.log("Props ", props)
        this.state = { 
            reps_completed: props.reps_completed
        };
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        console.log("click", this.props)
        this.setState(state => ({
            reps_completed: this.state.reps_completed + 1
        })
        );
        console.log("state", this.state)
    }

    componentDidUpdate() {
        fetch('/workouts/'+this.props.workoutId+'/exercises/'+this.props.exerciseID+'.json', {
            method: "PUT",
            headers: { 'Accept': 'application/json',
            'Content-Type': 'application/json',},
            body: JSON.stringify(this.state)
        })
    }

    render() {
    return <div>
        {this.props.exerciseID} | {this.props.exerciseName} - Goal: {this.props.repsGoal} | Completed: {this.state.reps_completed}  
        <button onClick={this.handleClick}>^</button>
    </div>
    }
  }