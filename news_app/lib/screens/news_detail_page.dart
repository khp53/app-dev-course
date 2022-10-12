import 'package:flutter/material.dart';
import 'package:news_app/model/news_techCrunch.dart';

class NewsDetailsPage extends StatefulWidget {
  final Articles articles;
  const NewsDetailsPage({super.key, required this.articles});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
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
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 120),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.articles.urlToImage!,
                //"https://techcrunch.com/wp-content/uploads/2022/10/zuck-horizon-worlds-1.jpg?resize=1200,614",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1582233479366-6d38bc390a08?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2083&q=80",
                ),
                radius: 35,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.articles.author ?? 'No Author',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.articles.title ?? 'No Title',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.history,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.articles.publishedAt ?? 'No Date',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.articles.source!.name ?? 'No Author',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(35),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height / 1.4,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  widget.articles.content ?? 'No Content',
                  //"Noom, a health coaching platform valued at USD 3.7 billion last year, is laying off a portion of staff for the second time in a matter of months, TechCrunch has learned from sources.\r\nNoom has laid off … [+3664 chars]",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
