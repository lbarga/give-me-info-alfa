import React from 'react';
import './app.css';

class App extends React.Component {
    constructor(props){
	    super(props);
	    this.state = {	  
            selectedFile: null,
            getData: []
        }
    }


	componentDidMount(){
        let that = this
        fetch('/api/v1/infos')
        .then(function(response){
        response.json().then(function(data){
            that.setState({
                getData: data
            })
        });
        })
        .catch(function(err){
        console.error('Failed retrieving information', err);
        });
	}

    fileSelectedHandler = event => {
        this.setState({
            selectedFile: event.target.files[0]
        })
    }

    postApi(){
        const fd = new FormData();
        fd.append(
            "file",
            this.state.selectedFile,
            this.state.selectedFile.name
        );

        fetch('/api/v1/infos', {
            method: 'POST',
            body: fd
        })
        .then(function (response) {
            console.log(response);
        })
        .catch(function (error) {
            console.log(error);
        });
    };

    render() {
        console.log(this.state)
        return (
            <div>
                <h1 className="h1">Upload your pdf, here!</h1>
            
                <input className="t1" type="file" onChange={this.fileSelectedHandler} />
                
                <button onClick={() => this.postApi()}>Upload</button>
                <h2>My Upload's</h2>
                {
                    this.state.getData.map((data, index) => {
                        return(
                            <form key={data.id}>
                                <label>Attachment:</label>
                                <a href={data.attachment_dir}>Download Info</a>
                                <br/>
                                <label>Content:</label>
                                <br/>
                                {data.content} 
                            </form>	

                        )
                    })
                }
            </div>
        );
    }
}
export default App;