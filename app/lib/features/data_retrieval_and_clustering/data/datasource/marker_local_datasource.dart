import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/marker_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/marker.dart';

abstract class MarkerLocalDataSource {
  List<Marker> populateMarkers(
      List<ClusterModel> clusters, List<MarkerModel> markers);
}

class MarkerLocalDataSourceImpl implements MarkerLocalDataSource {
  @override
  List<MarkerModel> populateMarkers(
      List<ClusterModel> clusters, List<MarkerModel> markers) {
    for (var cluster in clusters) {
      final marker = MarkerModel(
        height: 30,
        width: 30,
        position: cluster.centroidPosition,
        iconColor: cluster.color,
        iconSize: 30,
      );
      markers.add(marker);
    }
    return markers;
  }
}
