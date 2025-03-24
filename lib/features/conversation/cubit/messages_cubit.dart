import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talktive/entities/converstation_entity.dart';
import 'package:talktive/features/conversation/data/conversation_repo_imp.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());

  final conversationRepo = ConversationRepoImp();

  Future<void> fetchConversations() async{
    try{
      emit(MessagesStateLoading(status: "Fetching Conversations..."));
      final conversations = await conversationRepo.fetchConversations();
      emit(ConversationsFetchSuccess(conversations: conversations));
    }catch(e){
      emit(MessagesStateError(error: e.toString()));
    }
  }
}
