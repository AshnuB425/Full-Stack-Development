from django.db import models

class InterviewRound(models.Model):
    interview_id = models.AutoField(primary_key=True)
    
    candidate_id = models.IntegerField()
    interviewer_id = models.IntegerField()
    round_name = models.CharField(max_length=50)
    interview_date = models.DateField()
    score = models.IntegerField()
    decision = models.CharField(max_length=10)

    class Meta:
        db_table = 'interview_rounds'

    def __str__(self):
        return f"Interview {self.interview_id} - Candidate {self.candidate_id}"