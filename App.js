import React, { Component } from 'react';
import { Map, Marker, GoogleApiWrapper } from 'google-maps-react';
import { ResizeObserver } from 'resize-observer-polyfill'

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI.
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    // You can also log the error to an error reporting service
    logErrorToMyService(error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      // You can render any custom fallback UI
      return <h1>Something went wrong.</h1>;
    }

    return this.props.children; 
  }
}

export class App extends Component {
  render() {
    return (
      <ErrorBoundary>
        <div className = "App">
          <Map
            google={this.props.google}
            zoom={8}
            style={mapStyles}
            initialCenter={{ lat: 47.444, lng: -122.176 }}
          />
        </div>
      </ErrorBoundary>
    );
  }
}

export default GoogleApiWrapper({apiKey: ('AIzaSyCjt-279EWJO9s_rMWB4rMq8EQMzLg8xEU')})(App);

const mapStyles = {
  width: '100%',
  height: '100%',
};
