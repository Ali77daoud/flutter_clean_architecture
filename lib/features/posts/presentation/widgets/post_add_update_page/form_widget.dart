import 'package:clean_archeticture/features/posts/domain/entities/post.dart';
import 'package:clean_archeticture/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  final Post? post;
  final bool isUpdatePost;
  const FormWidget({Key? key, this.post, required this.isUpdatePost})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    //for update post , to add the title and the body to the textfield
    if (widget.isUpdatePost) {
      titleController.text = widget.post!.title.toString();
      bodyController.text = widget.post!.body.toString();
    }
    super.initState();
  }

  void validateFormThenAddOrUpdate() {
    Post post = Post(
        id: widget.isUpdatePost ? widget.post!.id!:null,
        title: titleController.text,
        body: bodyController.text);
    
    final isValidate = formKey.currentState!.validate();

    if (isValidate) {
      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      }else{
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: titleController,
              validator: (value) =>
                  value!.isEmpty ? "Title can't be empty" : null,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextFormField(
              controller: bodyController,
              validator: (value) =>
                  value!.isEmpty ? "Body can't be empty" : null,
              decoration: const InputDecoration(
                hintText: 'Body',
              ),
              minLines: 6,
              maxLines: 6,
            ),
          ),
          ElevatedButton.icon(
              onPressed: validateFormThenAddOrUpdate,
              label: widget.isUpdatePost
                  ? const Text('Update')
                  : const Text('Add'),
              icon: widget.isUpdatePost
                  ? const Icon(Icons.edit)
                  : const Icon(Icons.add)),
        ],
      ),
    );
  }
}
