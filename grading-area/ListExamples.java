import java.util.ArrayList;
import java.util.List;

interface StringChecker { boolean checkString(String s); }

class ListExamples {

  static List<String> filter(List<String> list, StringChecker sc) {
    List<String> result = new ArrayList<>();

    
    for(String s: list) {
      if(sc.checkString(s)) {
        result.add(s);
      }
    }
    return result;
  }


  static List<String> merge(List<String> list1, List<String> list2) {
    List<String> result = new ArrayList<>();

    int index1 = 0, index2 = 0;
    while(index1 < list1.size() && index2 < list2.size()) {
      if(list1.get(index1).compareTo(list2.get(index2)) < 0) {
        result.add(list1.get(index1));;
      }
      else {
        result.add(list2.get(index2));;
      }
      System.err.println(result.toString());
    }

    while(index1 < list1.size()) {
      result.add(list1.get(index1));
      index1 += 1;
    }

    while(index2 < list2.size()) {
      result.add(list2.get(index2));
      index2 += 1;
    }

    return result;
  }


}
