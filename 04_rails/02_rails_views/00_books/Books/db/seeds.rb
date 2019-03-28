# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

b1 = Book.create!(title: '1984', author: 'George Orwell', year: 1949, category: 'Dystopian', description: 'Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English writer George Orwell published in June 1949.[2][3] The novel is set in the year 1984 when most of the world population have become victims of perpetual war, omnipresent government surveillance and propaganda.')
b2 = Book.create!(title: 'The Ambassadors', author: 'Henry James', year: 1903, category: 'Dark Comedy', description: 'The Ambassadors is a 1903 novel by Henry James, originally published as a serial in the North American Review (NAR). This dark comedy, seen as one of the masterpieces of James''s final period, follows the trip of protagonist Lewis Lambert Strether to Europe in pursuit of Chad Newsome, his widowed fiancée''s supposedly wayward son; he is to bring the young man back to the family business, but he encounters unexpected complications. The third-person narrative is told exclusively from Strether''s point of view.')
b3 = Book.create!(title: 'An American Tragedy', author: 'Theodore Dreiser', year: 1925, category: 'Crime fiction', description: 'An American Tragedy is a novel by American writer Theodore Dreiser, published at the end of 1925. He began the manuscript in the summer of 1920, but a year later abandoned most of that text. In 1923 Dreiser returned to the project, and with the help of his wife Helen and two editor-secretaries, Louise Campbell and Sally Kusell, he completed the massive novel in 1925.[1]')
b4 = Book.create!(title: 'Brave New World', author: 'Aldous Huxley', year: 1932, category: 'Science fiction', description: 'Brave New World is a dystopian novel written in 1931 by English author Aldous Huxley, and published in 1932. Largely set in a futuristic World State of genetically modified citizens and an intelligence-based social hierarchy, the novel anticipates huge scientific developments in reproductive technology, sleep-learning, psychological manipulation, and classical conditioning that are combined to make a utopian society that goes challenged only by a single outsider. Huxley followed this book with a reassessment in an essay, Brave New World Revisited (1958), and with Island (1962), his final novel.')
b5 = Book.create!(title: 'Catch-22', author: 'Joseph Heller', year: 1961, category: 'Black comedy', description: 'Catch-22 is a satirical novel by American author Joseph Heller. He began writing it in 1953; the novel was first published in 1961. Often cited as one of the most significant novels of the twentieth century, it uses a distinctive non-chronological third-person omniscient narration, describing events from the points of view of different characters. The separate storylines are out of sequence so the timeline develops along with the plot. The novel is set during World War II, from 1942 to 1944. It mainly follows the life of Captain John Yossarian, a U.S. Army Air Forces B-25 bombardier. Most of the events in the book occur while the fictional 256th Squadron is based on the island of Pianosa, in the Mediterranean Sea, west of Italy. The novel looks into the experiences of Yossarian and the other airmen in the camp, who attempt to maintain their sanity while fulfilling their service requirements so that they may return home.')
b6 = Book.create!(title: 'The Catcher in the Rye', author: 'J. D. Salinger', year: 1951, category: 'Realistic fiction', description: 'The Catcher in the Rye is a story by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951.[3] A classic novel originally published for adults, it has since become popular among adolescent readers for its themes of angst, alienation and as a critique on superficiality in society.[4][5] It has been translated into almost all of the world''s major languages.[6]

Around one million copies are sold each year, with total sales of more than 65 million books.[7] The novel''s protagonist, Holden Caulfield, has become an icon for teenage rebellion.[8] The novel also deals with complex issues of innocence, identity, belonging, loss, and connection.')
b7 = Book.create!(title: 'A Clockwork Orange', author: 'Anthony Burgess', year: 1962, category: 'Dystopian fiction', description: 'A Clockwork Orange is a dystopian satirical black comedy novel by English writer Anthony Burgess, published in 1962. It is set in a near-future English society that has a youth subculture of extreme violence. The teenage protagonist, Alex, narrates his violent exploits, and his experiences with state authorities intent on reforming him.[1] The book is partially written in a Russian-influenced argot called "Nadsat", which takes its name from the Russian suffix that is equivalent to ''-teen'' in English.[2] According to Burgess, it was a jeu d''esprit written in just three weeks.[3]')