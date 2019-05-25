from django import forms
from operation.models import UserNote


class UserNoteForm(forms.ModelForm):
    class Meta:
        model = UserNote
        fields = ['notes']