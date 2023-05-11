import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/marker_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/marker.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/repositories/marker_repository.dart';

class PopulateMarkers {
  final MarkerRepository repository;

  PopulateMarkers(this.repository);

  List<Marker> run(List<ClusterModel> clusters, List<MarkerModel> markers) {
    return repository.populateMarkers(clusters, markers);
  }
}
