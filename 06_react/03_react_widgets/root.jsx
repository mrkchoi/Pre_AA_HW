import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const Root = (props) => (
  <React.Fragment>
    <Clock />
    <Tabs panes={[
      {
        title: 'one',
        content: 'The first tab'
      },
      {
        title: 'two',
        content: 'The second tab'
      },
      {
        title: 'three',
        content: 'The third and final tab'
      }
    ]} />
  </React.Fragment>
);

export default Root;
