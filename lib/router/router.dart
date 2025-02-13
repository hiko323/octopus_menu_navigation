import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/auth_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/events_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/feed_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/feed_wrapper.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/home_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/notifications_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/post_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/products_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/screens/profile_screen.dart';
import 'package:octopus_menu_navigation/common/presentation/widgets/menu_placeholder.dart';
import 'package:octopus_menu_navigation/common/presentation/root.dart';

/// [Enum] representing application routes, each associated with a `name` and an optional `title`.
///
/// Implements the [OctopusRoute] interface to integrate with a custom navigation system.
enum Routes with OctopusRoute {
  auth('auth', title: 'Auth'),
  root('root', title: 'Root'),
  home('home', title: 'Home'),
  feed('feed', title: 'Feed'),
  feedWrapper('feed-wrapper', title: 'Feed Wrapper'),
  post('post', title: 'Post'),
  products('products', title: 'Products'),
  menu('menu', title: 'Menu'),
  notifications('notifications', title: 'Notifications'),
  profile('profile', title: 'Profile'),
  events('events', title: 'Events');

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  // Method that defines how each route is mapped to its corresponding widget
  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) => switch (this) {
        Routes.auth => const AuthScreen(),
        Routes.root => const RootScreen(),
        Routes.home => const HomeScreen(),
        Routes.products => const ProductsScreen(),
        Routes.menu => const MenuPlaceholderScreen(),
        Routes.notifications => const NotificationsScreen(),
        Routes.profile => const ProfileScreen(),
        Routes.events => EventsScreen(
            title: node.arguments['title'],
          ),
        Routes.feedWrapper => const FeedWrapper(),
        Routes.feed => const FeedScreen(),
        Routes.post => PostScreen(
            id: node.arguments['id'],
          ),
      };
}
