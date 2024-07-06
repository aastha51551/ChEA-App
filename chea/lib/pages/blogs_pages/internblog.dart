import 'package:chea/pages/blogs_pages/template.dart';
import 'package:flutter/material.dart';
import 'buildCard.dart';




class InternBlog extends StatefulWidget {
  @override
  _InternBlogState createState() => _InternBlogState();
}

class _InternBlogState extends State<InternBlog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomTabView(pageTitle: 'Intern Blogs', tabs: [
        TabData(
          title: '2023',
          content: SingleChildScrollView(
            child: Container(
                color: Color(defaultBackground),
                child: const Column(
                  children:  [
                     buildCard(imageUrl: 'assets/images/JSecA23.jpg', description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.'
                    ,Title: "Long Title That Makes No Sense" ),
                  ],
                )),
          ),
        ),
        TabData(
          title: '2022',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
        TabData(
          title: '2021',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
        TabData(
          title: '2020',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
        TabData(
          title: 'Pre - 2020',
          content: Container(
            color: Color(defaultBackground),
          ),
        ),
      ]),
    );
  }
}

