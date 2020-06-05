const APIUtil = require('./api_util')

class FollowToggle {
    constructor(el, options) {

        this.$el = $(el);
        this.userId = this.$el.data("user-id") || options.userId;
        this.followState = this.$el.data("initial-follow-state") || options.followState;
        this.render();
        this.$el.on("click", this.handleClick.bind(this));
    }

    render() {
        
        if (this.followState === "unfollowed") {
            this.$el.prop("disabled", false)
            this.$el.html("Follow!");
        } 
        
        if (this.followState === "followed") {
            this.$el.prop("disabled", false)
            this.$el.html("Unfollow!");
        }

        if (this.followState === "following") {
            this.$el.prop("disabled", true)
            this.$el.html("Follow...");
        }

        if (this.followState === "unfollowing") {
            this.$el.prop("disabled", true)
            this.$el.html("Unfollowing...");
        }
    }

    handleClick(event) {
        let that = this;
        event.preventDefault();
        if (this.followState === "unfollowed") { //we clicked "follow", want to make current user follow the user
            this.followState = "following";
            this.render();
            APIUtil.followUser(this.userId).then(() => {
                that.followState = "followed";
                that.render();
            });
        } else if (this.followState === "followed") { // we clicked "unfollow", want to make current user unfollow the user
            this.followState = "unfollowing";
            this.render();
            APIUtil.unfollowUser(this.userId).then(() => {
                that.followState = "unfollowed";
                that.render();
            })
        }
    }
}


module.exports = FollowToggle;