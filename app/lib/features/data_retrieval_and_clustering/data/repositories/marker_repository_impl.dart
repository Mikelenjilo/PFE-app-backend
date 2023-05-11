import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/marker_local_datasource.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/marker_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/marker.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/marker_repository.dart';

class MarkerRepositoryImpl implements MarkerRepository {
  final MarkerLocalDataSource localDataSource;

  MarkerRepositoryImpl(this.localDataSource);

  @override
  List<Marker> populateMarkers(
      List<ClusterModel> clusters, List<MarkerModel> markers) {
    return localDataSource.populateMarkers(clusters, markers);
  }
}
