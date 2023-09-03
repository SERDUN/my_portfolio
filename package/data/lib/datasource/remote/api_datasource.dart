import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:domain/domain.dart';

import 'package:injectable/injectable.dart';

class ApiClient extends http.BaseClient {
  ApiClient(this._inner, this._customHeaders);

  final http.Client _inner;

  final Map<String, String> _customHeaders;

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['content-type'] = 'application/json; charset=utf-8';
    request.headers['accept'] = 'application/json';

    request.headers.addAll(_customHeaders);

    return _inner.send(request);
  }
}

@Injectable()
class ApiDatasource {
  ApiDatasource({
    @Named('userId') required this.userId,
    @Named('baseUrl') required this.baseUrl,
  });

  final String userId;
  final Uri baseUrl;

  late final apiClient = ApiClient(http.Client(), {
    'x-user-id': userId,
  });

  get userPath => "/user";

  get contactsPath => "/contacts";

  get skillsPath => "/skills";

  get projectsPath => "/projects";

  Uri _endpoint(String path) => baseUrl.replace(path: baseUrl.path + path);

  Future<List<ProjectDTO>> getProjects(String localization) async {
    final response = await apiClient.get(_endpoint(projectsPath), headers: {
      'accept-language': localization,
    });
    var jsonResult = jsonDecode(response.body) as List;
    List<ProjectDTO> projects = jsonResult.map((data) => ProjectDTO.fromJson(data)).toList();
    return projects;
  }

  Future<List<ContactsDTO>> getContacts() async {
    final response = await apiClient.get(_endpoint(contactsPath), headers: {
      'accept-language': 'en',
    });
    var jsonResult = jsonDecode(response.body) as List;
    List<ContactsDTO> contacts = jsonResult.map((data) => ContactsDTO.fromJson(data)).toList();
    return contacts;
  }


  Future<List<PortfolioSkillsDTO>> getSkills() async {
    final response = await apiClient.get(_endpoint(skillsPath), headers: {
      'accept-language': 'en',
    });
    var jsonResult = jsonDecode(response.body) as List;
    List<PortfolioSkillsDTO> contacts = jsonResult.map((data) => PortfolioSkillsDTO.fromJson(data)).toList();
    return contacts;
    // String data = await rootBundle.loadString('packages/data/assets/data/en/skills.json');
    // var jsonResult = json.decode(data) as List;
    // List<PortfolioSkillsDTO> skills = jsonResult.map((data) => PortfolioSkillsDTO.fromJson(data)).toList();
    // return Future.value(skills);
  }

  Future<PortfolioUserDTO> getUser(String localization) async {
    final response = await apiClient.get(_endpoint(userPath));
    return PortfolioUserDTO.fromJson(jsonDecode(response.body));
  }
}
