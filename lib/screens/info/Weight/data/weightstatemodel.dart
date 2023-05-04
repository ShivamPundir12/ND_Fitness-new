//* Let's create a state model

class Weight {
  String? weight;

  Weight({
    this.weight,
  });

  void setName(String getName) {
    weight = getName;
  }

  String getName() {
    return weight!;
  }
}

List<Weight> totalStates() {
  List<Weight> states = [];
  Weight statesModel = new Weight();

  for (int i = 40; i <= 80; i++) {
    statesModel.setName(i.toString());
    states.add(statesModel);
    statesModel = new Weight();
  }

  return states;
}

