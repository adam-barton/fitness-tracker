'use strict';

const e = React.createElement;

class Exercise extends React.Component {

    constructor(props) {
        super(props);
        this.state = { 
            reps_completed: props.reps_completed
        };
        this.handleUpClick = this.handleUpClick.bind(this);
        this.handleDownClick = this.handleDownClick.bind(this);
    }

    handleUpClick() {
        this.setState(state => ({
            reps_completed: this.state.reps_completed + 1
        })
        );
    }
    handleDownClick() {
        this.setState(state => ({
            reps_completed: this.state.reps_completed - 1
        })
        );
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
        {this.props.exerciseID} | {this.props.exerciseName} - Goal: {this.props.repsGoal} | Completed: {this.state.reps_completed }  -  
         -  <button onClick={this.handleUpClick}>⬆️</button><button onClick={this.handleDownClick}>⬇️</button>
    </div>
    }
  }