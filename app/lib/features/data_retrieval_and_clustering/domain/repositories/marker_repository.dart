import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/marker_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/marker.dart';

abstract class MarkerRepository {
  List<Marker> populateMarkers(
      List<ClusterModel> clusters, List<MarkerModel> markers);
}
