const faker = require("faker");

function randomIntFromInterval(min, max) {
  // min and max included
  return Math.floor(Math.random() * (max - min + 1) + min);
}

module.exports = () => {
  const TOTAL_USERS = 40;
  const TOTAL_POSTS = 40;
  const TOTAL_STORIES = 20;

  const data = {
    users: [],
    posts: [],
    stories: []
  };

  for (let i = 1; i <= TOTAL_USERS; i++) {
    data.users.push({
      id: i,
      username: faker.name.firstName().toLowerCase(),
      fullName: `${faker.name.firstName()} ${faker.name.lastName()}`,
      avatarUrl: faker.image.avatar()
    });
  }

  for (let i = 1; i <= TOTAL_POSTS; i++) {
    data.posts.push({
      id: i,
      user: data.users[randomIntFromInterval(0, TOTAL_USERS)],
      medias: [
        {
          mediaUrl: faker.image.imageUrl(800, 600, "food", true, true),
          mediaType: "image"
        }
      ],
      location: faker.address.city(),
      description: faker.lorem.sentences(1),
      isLoved: false,
      isSaved: false,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString()
    });
  }

  for (let i = 1; i <= TOTAL_STORIES; i++) {
    data.stories.push({
      id: i,
      isRead: false,
      user: data.users[randomIntFromInterval(0, TOTAL_USERS)],
      medias: [
        {
          mediaUrl: faker.image.imageUrl(800, 600, "people", true, true),
          mediaType: "image"
        },
        {
          mediaUrl: faker.image.imageUrl(800, 600, "people", true, true),
          mediaType: "image"
        }
      ]
    });
  }

  return data;
};
