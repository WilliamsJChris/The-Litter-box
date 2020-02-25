import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { Map, Marker, GoogleApiWrapper } from 'google-maps-react';

function App(){
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
          <Map
            google={window.google}
            zoom={8}
            style={mapStyles}
            initialCenter={{ lat: 33.543682, lng: -86.779633 }}
          >
            <Marker position={{ lat: 33.543682, lng: -86.779633 }} />
            <Marker position={{ lat: 33.444100, lng: -86.815390 }} />
          </Map>
      </header>
    </div>
  );
}

const mapStyles = {
  width: '100%',
  height: '100%',
};

export default GoogleApiWrapper({apiKey: ('AIzaSyCjt-279EWJO9s_rMWB4rMq8EQMzLg8xEU')})(App);
