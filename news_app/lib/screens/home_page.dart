import 'package:flutter/material.dart';
import 'package:news_app/model/news_techCrunch.dart';
import 'package:news_app/screens/news_detail_page.dart';
import 'package:news_app/services/news_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsService newsService = NewsService();

  NewsTechCrunch? news;

  getNews() async {
    final map = await newsService.getAllTechCrunchNews();
    setState(() {
      news = NewsTechCrunch.fromJson(map);
    });
    return news;
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.white.withOpacity(0.5),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(
            Icons.browse_gallery,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(
            width: 25,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1582233479366-6d38bc390a08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2083&q=80",
            ),
            radius: 25,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1609793002435-f78947a5cea8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(25),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6.5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.sort,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.bookmark,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // card for first element of news
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsDetailsPage(
                        articles: news!.articles!.first,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 40,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: news!.articles!.first.urlToImage != null
                                ? Image(
                                    image: NetworkImage(
                                      news!.articles!.first.urlToImage!,
                                      //"https://plus.unsplash.com/premium_photo-1663047707111-c022dee3abe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80,",
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : const Center(
                                    child: Icon(Icons.no_photography)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            news!.articles!.first.title ?? "no title",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.person_rounded),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                news!.articles!.first.author ?? "no title",
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                news!.articles!.first.publishedAt ?? "no title",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                // bottom news title
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: news!.articles!.length - 1,
                  itemBuilder: (context, index) {
                    if (index < 1) {
                      return Container();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NewsDetailsPage(
                                articles: news!.articles![index],
                              ),
                            ),
                          ),
                          leading: SizedBox(
                            height: 100,
                            width: 70,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image(
                                image: NetworkImage(
                                  news!.articles![index].urlToImage!,
                                  //"https://plus.unsplash.com/premium_photo-1663047707111-c022dee3abe7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80,",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            news!.articles![index].title ?? 'no title',
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            news!.articles![index].author ?? 'no author',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
