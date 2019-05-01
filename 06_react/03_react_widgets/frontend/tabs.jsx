import React from 'react';

class Headers extends React.Component {
  render() {
    const selected = this.props.selectedPane;
    const headers = this.props.panes.map((pane, index) => {
      const title = pane.title;
      const klass = index === selected ? 'active' : '';
      
      return (
        <li key={index} onClick={() => this.props.onTabChosen(index)}>
          {title}{' '}
        </li>
      );
    });
    
    return (
      <ul className="tab_header">
        {headers}
      </ul>
    );
  }
}

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedPane: 0
    }
  }

  selectTab(num) {
    this.setState({selectedPane: num});
  }
  
  render() {
    let pane = this.props.panes[this.state.selectedPane];

    return (
      <div>
        <h1>Tabs</h1>
        <div className="main main_tabs">
          <Headers 
            panes={this.props.panes}
            onTabChosen={this.selectTab.bind(this)}
            selectedPane={this.state.selectedPane}>
            </Headers>
          <div className="tabs_content">
            <article>
              {pane.content}
            </article>
          </div>
        </div>
      </div>
    )
  }
}
export default Tabs;
