from rest_framework import serializers
from .models import InterviewRound

class InterviewRoundSerializer(serializers.ModelSerializer):
    url = serializers.HyperlinkedIdentityField(view_name='round-detail')

    class Meta:
        model = InterviewRound
        fields = ['interview_id', 'url', 'candidate_id', 'interviewer_id', 'round_name', 'interview_date', 'score', 'decision']