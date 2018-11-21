User.destroy_all
Article.destroy_all

User.create!([
    {email: 'premium@test.com', password: '123123', role: 1},
    {email: 'author@test.com', password: '123123', role: 2},
    {email: 'editor@test.com', password: '123123', role: 3}
])

Category.create!([{ name: 'Inspiring' }, { name: 'History'}, { name: 'Science'}])

Article.create!([
    {title: 'Zak is the best', content: 'Good luck to all of you guys, really hope you find a job!', author: 'Restful 7', category_id: 1},
    {title: 'A serious article', content: 'This is some very serious news.', author: 'William B.', category_id: 1},
    {title: 'Daniel is amazing', content: 'Hope everything is going well Daniel! Lycke till!', author: 'Restful 7', category_id: 1}
])