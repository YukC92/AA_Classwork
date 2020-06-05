const APIUtil = {
    followUser: id => {
      $.ajax({
        url: `/users/${id}/follow`,
        method: "POST",
        dataType: "json"
      })
    },
  
    unfollowUser: id => {
      $.ajax({
        url: `/users/${id}/follow`,
        method: "DELETE",
        dataType: 'json'
      })
    },

    searchUsers: queryVal => {
        $.ajax({
            url: '/users/search',
            method: 'GET',
            dataType: 'json',
            data: { queryVal } 
        })
    }
  };
  
  module.exports = APIUtil;