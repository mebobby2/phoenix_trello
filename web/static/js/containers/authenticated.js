import React from 'react';
import {push} from 'react-router-redux';
import { connect }  from 'react-redux';
import Actions from '../actions/sessions';

class AuthenticatedContainer extends React.Component {
	componentDidMount() {
		const {dispatch, currentUser} = this.props;
		const phoenixAuthToken = localStorage.getItem('phoenixAuthToken');

		if (phoenixAuthToken && !currentUser) {
			dispatch(Actions.currentUser());
		} else if (!phoenixAuthToken){
			dispatch(push('/sign_in'));
		}
	}

	render() {
		const { currentUser, dispatch } = this.props;

    	if (!currentUser) return false;

		return <div className="application-container">
        <div className='main-container'>
          {this.props.children}
        </div>
    </div>
	}
}

const mapStateToProps = (state) => ({
  currentUser: state.session.currentUser,
});

export default connect(mapStateToProps)(AuthenticatedContainer);
