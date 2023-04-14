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

  //1
  statesModel.setName("16");
  states.add(statesModel);
  statesModel = new Weight();

  //2
  statesModel.setName("17");
  states.add(statesModel);
  statesModel = new Weight();

  //3
  statesModel.setName("18");

  states.add(statesModel);
  statesModel = new Weight();

  //4
  statesModel.setName("19");

  states.add(statesModel);
  statesModel = new Weight();

  //5
  statesModel.setName("20");

  states.add(statesModel);
  statesModel = new Weight();

  //6
  statesModel.setName("21");

  states.add(statesModel);
  statesModel = new Weight();

  //7
  statesModel.setName("22");

  states.add(statesModel);
  statesModel = new Weight();

  //8
  statesModel.setName("23");

  states.add(statesModel);
  statesModel = new Weight();

//9
  statesModel.setName("24");

  states.add(statesModel);
  statesModel = new Weight();

//10
  statesModel.setName("25");

  states.add(statesModel);
  statesModel = new Weight();

  //11
  statesModel.setName("26");

  states.add(statesModel);
  statesModel = new Weight();

  //12
  statesModel.setName("27");

  states.add(statesModel);
  statesModel = new Weight();

  //13
  statesModel.setName("28");

  states.add(statesModel);
  statesModel = new Weight();

  //14
  statesModel.setName("29");

  states.add(statesModel);
  statesModel = new Weight();

  //15
  statesModel.setName("30");

  states.add(statesModel);
  statesModel = new Weight();

  //16
  statesModel.setName("31");

  states.add(statesModel);
  statesModel = new Weight();

  //17
  statesModel.setName("32");

  states.add(statesModel);
  statesModel = new Weight();

  //18
  statesModel.setName("33");

  states.add(statesModel);
  statesModel = new Weight();

  //19
  statesModel.setName("34");

  states.add(statesModel);
  statesModel = new Weight();

  //20
  statesModel.setName("35");

  states.add(statesModel);
  statesModel = new Weight();

  //21
  statesModel.setName("36");

  states.add(statesModel);
  statesModel = new Weight();

  //22
  statesModel.setName("37");

  states.add(statesModel);
  statesModel = new Weight();
  //23
  statesModel.setName("38");

  states.add(statesModel);
  statesModel = new Weight();
  //24
  statesModel.setName("39");

  states.add(statesModel);
  statesModel = new Weight();
  //25
  statesModel.setName("40");

  states.add(statesModel);
  statesModel = new Weight();
  //26
  statesModel.setName("41");

  states.add(statesModel);
  statesModel = new Weight();
  //27
  statesModel.setName("42");

  states.add(statesModel);
  statesModel = new Weight();
  //28
  statesModel.setName("43");

  states.add(statesModel);
  statesModel = new Weight();
  //29
  statesModel.setName("44");

  states.add(statesModel);
  statesModel = new Weight();

  //31
  statesModel.setName("45");

  states.add(statesModel);
  statesModel = new Weight();
  //32
  statesModel.setName("46");

  states.add(statesModel);
  statesModel = new Weight();
  //30
  statesModel.setName("47");

  states.add(statesModel);
  statesModel = new Weight();
  //33
  statesModel.setName("48");

  states.add(statesModel);
  statesModel = new Weight();
  //34
  statesModel.setName("49");

  states.add(statesModel);
  statesModel = new Weight();
  //35
  statesModel.setName("50");

  states.add(statesModel);
  statesModel = new Weight();

  //36
  statesModel.setName("51");

  states.add(statesModel);
  statesModel = new Weight();

  return states;
}
