import 'package:angular2/core.dart';
import 'dart:math';

import 'hero.dart';
import 'hero_service.dart';

List<String> _powers = const [
  "Super smart",
  "Super attractive",
  "Super strong"
];

@Component(
    selector: 'hero-form',
    templateUrl: 'hero_form_component.html'
)
class HeroFormComponent {
  HeroService heroService;
  @Output() final EventEmitter<Hero> submitRequest = new EventEmitter<Hero>();

  HeroFormComponent(this.heroService);

  List<String> get powers => _powers;
  Hero model = new Hero('Smart Man', _powers[0], 'Albert');

  void onSubmit() {
    submitRequest.emit(model);
    model = new Hero('', '');
  }

  // broken if you were to type a matching letter not at the end of the field
  String properCase(String s) {
    return s.replaceAllMapped(new RegExp(r'\b([a-z])'), (Match m) => m.group(1).toUpperCase());
  }
}