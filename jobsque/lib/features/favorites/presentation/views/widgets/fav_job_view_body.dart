// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/assets.dart';
import 'package:jobsque/core/utils/styles.dart';
import 'package:jobsque/features/favorites/presentation/views/widgets/no_saved_view_body.dart';
import 'package:jobsque/features/favorites/presentation/views/widgets/saved_job_container.dart';

class FavJobViewBody extends StatefulWidget {
  const FavJobViewBody({super.key});

  @override
  _FavJobViewBodyState createState() => _FavJobViewBodyState();
}

class _FavJobViewBodyState extends State<FavJobViewBody> {
  late Future<List<Job>> futureJobs;
  final TokenStorage tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    futureJobs = fetchFavoriteJobs();
  }

  Future<List<Job>> fetchFavoriteJobs() async {
    String? bearerToken = await tokenStorage.getToken();
    const String apiUrl = 'https://project2.amit-learning.com/api/favorites';
    final Dio dio = Dio();

    try {
      final response = await dio.get(
        apiUrl,
        options: Options(headers: {'Authorization': 'Bearer $bearerToken'}),
      );
      if (response.statusCode == 200) {
        List<dynamic> jobData = response.data['data'];
        return jobData.map((data) => Job.fromJson(data['jobs'])).toList();
      } else {
        throw Exception('Failed to load jobs');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      } else {
        throw Exception('Failed to load jobs: $e');
      }
    } catch (e) {
      throw Exception('Failed to load jobs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          FutureBuilder<List<Job>>(
            future: futureJobs,
            builder: (context, snapshot) {
              // Show job count dynamically
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return SavedJobContainerWidget(
                  jobLength: snapshot.data!.length.toString(),
                );
              } else {
                return const SavedJobContainerWidget(
                  jobLength: "0",
                );
              }
            },
          ),
          const SizedBox(height: 25),
          Expanded(
            child: FutureBuilder<List<Job>>(
              future: futureJobs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString().contains("404")
                        ? 'No job saved!'
                        : 'Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView(
                    children: snapshot.data!.map((job) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListTile(
                              leading: job.image != null
                                  ? CircleAvatar(
                                      child: Image.network(
                                        job.image!,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                              title: Text(
                                job.name ?? 'No Name',
                                style: AppStyles.mediumFont18.copyWith(
                                  color: const Color(0xFF111827),
                                ),
                              ),
                              subtitle: Text(
                                '${job.compName} • Cairo, Egypt',
                                style: AppStyles.normalFont12.copyWith(
                                  color: const Color(0xFF374151),
                                ),
                              ),
                              trailing:
                                  SvgPicture.asset(Assets.imagesOptionsIcon),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Posted 2 days ago",
                                  style: AppStyles.normalFont12.copyWith(
                                    color: const Color(0xFF374151),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                      size: 13,
                                    ),
                                    Text(
                                      "Be an early applicant",
                                      style: AppStyles.normalFont12.copyWith(
                                        color: const Color(0xFF374151),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          const SizedBox(height: 5),
                        ],
                      );
                    }).toList(),
                  );
                } else {
                  return const NoJobSavedViewBody(); // Display the custom widget
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
