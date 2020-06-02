
function collapseExercises(event) {

    let list = document.getElementById(`exercises-list-${event.target.dataset.workoutId}`)
    if (list.classList.contains('closed')) {
        // list.classList.add('open');
        list.classList.remove('closed')
    } else {
        list.classList.add('closed');
    }
}

