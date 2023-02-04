import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:recipe_detail_flutter_ui/config/colors.dart';
import 'package:tourandtravel/widgets/detail_appbar.dart';
import 'package:tourandtravel/config/colors.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const RecipeDetailAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cacao Maca Walnut Milk',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kSecondaryTextColor),
                    child: Row(
                      children: [
                        // const Text('Food'),
                        const SizedBox(width: 8.0),
                        Container(
                          height: 5.0,
                          width: 5.0,
                          decoration: const BoxDecoration(
                            color: kSecondaryTextColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // const Text('60 mins'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // children: [
                    //   // Row(
                    //   //   children: [
                    //   //     Container(
                    //   //       height: 32.0,
                    //   //       width: 32.0,
                    //   //       margin: const EdgeInsets.only(right: 8.0),
                    //   //       decoration: BoxDecoration(
                    //   //         shape: BoxShape.circle,
                    //   //         image: const DecorationImage(
                    //   //           image: AssetImage(
                    //   //               'assets/images/profile_image.jpg'),
                    //   //           fit: BoxFit.cover,
                    //   //         ),
                    //   //         boxShadow: [
                    //   //           BoxShadow(
                    //   //             offset: const Offset(0, 4),
                    //   //             blurRadius: 4.0,
                    //   //             color: Colors.black.withOpacity(0.25),
                    //   //           ),
                    //   //         ],
                    //   //       ),
                    //   //     ),
                    //   //     Text(
                    //   //       'Elena Shelby',
                    //   //       style: Theme.of(context).textTheme.titleSmall,
                    //   //     ),
                    //   //   ],
                    //   // ),
                    //   // Row(
                    //   //   children: [
                    //   //     Container(
                    //   //       height: 32.0,
                    //   //       width: 32.0,
                    //   //       alignment: Alignment.center,
                    //   //       margin: const EdgeInsets.only(right: 8.0),
                    //   //       decoration: const BoxDecoration(
                    //   //         shape: BoxShape.circle,
                    //   //         color: kPrimaryColor,
                    //   //       ),
                    //   //       child: SvgPicture.asset('assets/icons/Heart.svg'),
                    //   //     ),
                    //   //     Text(
                    //   //       '273 Likes',
                    //   //       style: Theme.of(context).textTheme.titleSmall,
                    //   //     ),
                    //   //   ],
                    //   // ),
                    // ],
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: kOutlineColor, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Gondar, also spelled Gonder is a city and woreda in Ethiopia. Located in the North Gondar Zone of the Amhara Region',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kSecondaryTextColor),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: kOutlineColor, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'reccommend palces to visit',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16.0),
                  _buildIngredientItem(context, 'fasil castle'),
                  _buildIngredientItem(context, 'mounatins'),
                  _buildIngredientItem(context, 'rivers'),
                  const Divider(color: kOutlineColor, height: 1.0),
                  const SizedBox(height: 16.0),
                  Text(
                    'additional info',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 16.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kMainTextColor,
                        ),
                        child: Text(
                          '1',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Gonder is best known for its castle ruins and decorated churches. The castle ruins, known as Fasil Ghebbi, are a series of buildings that were once the home of Ethiopian royalty.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1466637574441-749b8f19452f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=300&q=80',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(
    BuildContext context,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            height: 24.0,
            width: 24.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE3FFF8),
            ),
            child: SvgPicture.asset('assets/icons/check.svg'),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
