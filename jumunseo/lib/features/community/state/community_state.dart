import '../model/comment.dart';
import '../model/post.dart';

class CommunityState{

  Post post = Post();

  List<Post> posts = [
    // 백엔드 구성 전까지 임시로 생성
    Post(
      id: "0",
      title: "이혼 소송 관련 고민",
      contents: "최근 이혼 과정에서 법적인 문제에 직면했습니다. 이혼 소송에서 어떻게 해야 할지 막막하네요. 변호사를 고용해야 할까요?",
      userId: "김이혼",
      comments: [
        Comment(
            id: "0",
            contents: "변호사를 고용하는 것이 좋습니다. 전문가의 도움을 받으면 더 원활한 소송 진행이 가능합니다.",
          userId: "변호사1",
          datetime: DateTime(2024, 4, 5)
        ),
        Comment(
            id: "1",
            contents: "상황에 따라 변호사 없이도 진행할 수 있지만, 복잡한 문제가 있다면 전문가의 조언이 필요합니다.",
          userId: "변호사2",
          datetime: DateTime(2024, 4, 6)
        ),
        Comment(
            id: "2",
            contents: "변호사를 고용하면 자신의 권리를 보호할 수 있어요. 소송에서 중요한 부분이니 꼭 고려해보세요.",
          userId: "변호사1",
          datetime: DateTime(2024, 4, 7)
        ),
      ],
      datetime: DateTime(2024, 4, 5),
      boardId: "커뮤니티",
      images: [],
    ),

    Post(
      id: "1",
      title: "부동산 임대 문제로 인한 고민",
      contents: "부동산을 임대하고 있는데, 임차인과의 분쟁이 발생했습니다. 임대 계약서에 어긋나는 행동을 하는데, 어떻게 대응해야 할지 모르겠습니다.",
      userId: "임대인",
      comments: [
        Comment(
            id: "0",
            contents: "먼저 임차인과의 대화를 통해 문제를 해결해보세요. 상호간의 합의가 최선의 해결책일 수 있습니다.",
          userId: "부동산1",
          datetime: DateTime(2024, 4, 7)
        ),
        Comment(
            id: "1",
            contents: "임차인이 계약을 어기고 있다면, 변호사와 상담하여 법적인 조치를 취할 수 있습니다. 권리를 지키기 위해 적절한 대응이 필요합니다.",
          userId: "해피부동산",
          datetime: DateTime(2024, 4, 7)
        ),
        Comment(
            id: "2",
            contents: "분쟁을 미리 예방하기 위해 명확한 임대 계약서를 작성하는 것이 중요합니다. 앞으로의 계약에는 더 신중하게 접근해보세요.",
          userId: "해결사",
          datetime: DateTime(2024, 4, 7)
        ),
      ],
      datetime: DateTime(2024, 4, 7),
      boardId: "커뮤니티",
      images: [],
    ),

    Post(
      id: "2",
      title: "소송 과정에서의 비용 부담",
      contents: "소송 과정에서 예상치 못한 비용이 발생하여 부담스럽습니다. 법적인 절차를 진행하면서 비용을 어떻게 관리해야 할지 고민입니다.",
      userId: "고민",
      comments: [
        Comment(
            id: "0",
            contents: "소송 과정에서 발생하는 비용은 예측하기 어렵습니다. 따라서 미리 예산을 설정하고, 변호사와 상의하여 비용을 최대한 줄일 수 있는 방법을 찾아보세요.",
          userId: "변호사1",
          datetime: DateTime(2024, 4, 9)
        ),
        Comment(
            id: "1",
            contents: "법정에서 승리한다고 해도 소송 비용이 상당할 수 있습니다. 비용 부담을 최소화하기 위해 변호사와 함께 전략을 세워보세요.",
          userId: "변호사2",
          datetime: DateTime(2024, 4, 9)
        ),
        Comment(
            id: "2",
            contents: "소송 비용에 대한 걱정은 자연스러운 일입니다. 하지만 이를 극복하기 위해 변호사와 협력하여 적절한 대책을 세우는 것이 중요합니다.",
          userId: "변호사3",
          datetime: DateTime(2024, 4, 9)
        ),
      ],
      datetime: DateTime(2024, 4, 9),
      boardId: "커뮤니티",
      images: []
    ),


    Post(
      id: "3",
      title: "계약 파기로 인한 분쟁",
      contents: "계약 파기로 인한 분쟁이 발생했습니다. 상대방이 계약 내용을 어긴 채로 파기를 요구하고 있습니다. 이에 대한 대응 방안이 필요합니다.",
      userId: "고민",
      comments: [
        Comment(
          id: "0",
          contents: "소송 과정에서 발생하는 비용은 예측하기 어렵습니다. 따라서 미리 예산을 설정하고, 변호사와 상의하여 비용을 최대한 줄일 수 있는 방법을 찾아보세요.",
          userId: "변호사1",
          datetime: DateTime(2024, 4, 10)
      ),
        Comment(
            id: "1",
            contents: "상대방의 계약 파기 요구가 정당한지 확인해야 합니다. 계약 내용을 꼼꼼히 검토하고, 변호사와 상담하여 다음 단계를 결정하세요.",
          userId: "변호사2",
          datetime: DateTime(2024, 4, 10)
        ),
      ],
      datetime: DateTime(2024, 4, 10),
      boardId: "커뮤니티",
      images: [],
    )
  ];
}