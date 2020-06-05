const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./user_search')

$(() => {
    $('button.follow-toggle').each( (idx, ele) => new FollowToggle(ele, {}) );
    $('.user-search').each( (idx, ele) => new UsersSearch(ele, {}) );
});